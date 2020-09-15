#!/bin/bash

DEPLOY_PATH="../waveletlab-uestc.github.io"
BUILD_PATH="./public"
#HOST=localhost
HOST=192.168.56.2
PORT=3000

is_yarn_init() {
    if [[ -d ".saber" && -d "node_modules" ]]; then
        return 0
    else
        return -1
    fi
}

yarn_init() {
    yarn
}

yarn_dev() {
    if ! is_yarn_init; then
        yarn_init
    fi
    yarn run dev --host $HOST --port $PORT
}

yarn_build() {
    if ! is_yarn_init; then
        yarn_init
    fi
    yarn run build
}

clean() {
    rm -rf .saber node_modules
    rm -rf "$BUILD_PATH"
}

usage() {
cat <<EOF
Usage: build.sh {[build] | deploy [--only | --no-git] | dev | clean | help}
       where build is optional, default command;
       deploy means deploy static files builed from $BUILD_PATH to $DEPLOY_PATH,
              with option --only which means only deploy exclude build,
                   option --no-git which doesn't invoke git to push to remote repo, default is False;
       dev means run server at http://$HOST:$PORT;
       clean remove all generated files and go back to un-initilized status;
       help shows this page.
EOF

    local ret="$1"
    if [[ -z "$ret" ]]; then
        ret=0
    fi
    exit $ret
}

# merge two directories
merge_directory() {
    local src="$1"
    local dst="$2"
    # first paramater MUST be a directory
    if [[ ! -d "$src" ]]; then
        return 1
    fi

    # if has rysnc, use it first
    if which rsync &> /dev/null; then
        rsync -rc -vv --delete \
            --exclude='.git' \
            --exclude='CNAME' \
            --exclude='.nojekyll' \
            --exclude='README.md' \
            "$src/" "$dst/"
        # -r: recursive
        # -c: enable checksum
        # --delete: delete file if it's not in $src directory
        # --exclude: remain file in $dst directory
        # -vv: verbose
        # NOTE must append / at the end of directory
        return 0
    fi

    for file in $(ls "$src"); do
        if [[ -d "$dst/$file" ]]; then
            if [[ -d "$src/$file" ]]; then
                merge_directory "$src/$file" "$dst/$file"
            else
                echo "$src/$file is file, but a directory $file is in $dst. Ignore $src/$file"
            fi
        else
            echo "cp $src/$file to $dst/$file"
            cp -f "$src/$file" "$dst/$file"
        fi
    done
    return 0
}


deploy() {
    local deploy_only=0
    local invoke_git=1
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --only)
                deploy_only=1
                ;;
            --no-git)
                invoke_git=0
                ;;
            *)
                echo "un-cognitive option $1"
                return 2
                ;;
        esac
        shift
    done

    if [[ $deploy_only == 0 ]]; then
        echo "building to $BUILD_PATH ..."
        yarn_build
    elif [[ ! -d "$BUILD_PATH" ]]; then
        echo "No builed files, building to $BUILD_PATH ..."
        yarn_build
    fi

    echo "deploy files to $DEPLOY_PATH ..."
    merge_directory "$BUILD_PATH" "$DEPLOY_PATH"

    if [[ $invoke_git == 1 ]]; then
        # The symbol > means depress output
        pushd "$DEPLOY_PATH" > /dev/null
        git add -A
        git commit
        git push > /dev/null
        popd
    fi

    echo "deploy over."
}

if [[ $# == 0 ]]; then
    yarn_build
    exit 0
fi

ret=0
case "$1" in
    b|build)
        yarn_build
        ;;
    d|deploy)
        shift   # remove deploy paramater from $@
        deploy $@
        if [[ $? != 0 ]]; then
            usage $?
        fi
        ;;
    dev)
        yarn_dev
        ;;
    clean)
        clean
        ;;
    *)
        if [[ "help" != "$1" ]]; then
            echo "un-cognitive command $1"
            ret=1
        fi
        usage $ret
        ;;
esac
