<template>
  <div>
    <Navbar />
    <main>
      <Breadcrumb :name="page.attributes.title" />
      <div class="container">
        <div class="columns">
          <Sidebar class="column is-one-quarter" />
          <div class="column">
            <div class="content">
              <slot name="default" />
            </div>
          </div>
        </div>
      </div>
    </main>
    <Submission />
    <AppFooter />
  </div>
</template>
<script>
import Sidebar from '../components/Sidebar.vue'
import Navbar from '../components/Navbar.vue'
import Breadcrumb from '../components/Breadcrumb'
import Submission from '../components/Submission.vue'
import AppFooter from '../components/AppFooter.vue'
import transition from '../components/PageTransition'

export default {
  props: ['page'],
  components: {
    Sidebar,
    Navbar,
    Breadcrumb,
    Submission,
    AppFooter
  },
  head() {
    return {
      title: '2020 17th ICCWAMTIP',
      link: [
        { rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css' },
        { rel: 'stylesheet', href: './css/style.css' },
      ],
      script: [
        { defer: true, src: 'https://use.fontawesome.com/releases/v5.3.1/js/all.js' },
      ]
    }
  },
  mounted() {
    this.$nextTick(() => {
      let table = document.querySelector('table')
      if (table) {
        table.setAttribute('class', 'table is-bordered is-striped is-hoverable')
      }
    })
  },
  transition
}
</script>
<style scoped>
.page-enter-active main,
.page-leave-active main {
  transition: opacity 0.5s, transform 0.5s ease;
}

.page-leave-to main {
  opacity: 0;
  transform: translateX(-30%);
}

.page-enter main {
  opacity: 0;
  transform: translateX(30%);
}
</style>
