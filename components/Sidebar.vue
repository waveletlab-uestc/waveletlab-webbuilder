<template>
  <div>
    <aside class="menu has-background-light">
      <ul class="menu-list is-size-5 is-capitalized">
        <li>
          <saber-link to="/information.html">Conference Information</saber-link>
        </li>
        <li>
          <saber-link to="/guidance.html">Author Guidance</saber-link>
        </li>
        <li>
          <saber-link to="/timeline.html">Conference Timeline</saber-link>
        </li>
      </ul>
    </aside>
    <div class="tile-wrapper">
    <div class="tile is-child notification is-primary">
      <p class="title">
        ICCWAMTIP Conference Flyer!
      </p>
      <p class="subtitle">
        Everything you need to know here.
      </p>
      <p style="margin-bottom: 1em"><a class="button is-uppercase is-white is-outlined" style="width: 9em" href="/doc/CallforPaper-EN.pdf" download="CallforPaper-EN.pdf">Call for paper</a>
      </p>
      <p><a class="button is-uppercase is-white is-outlined" style="width: 9em" href="/doc/paper-format.dotx" download="paper-format.dotx">Paper format</a>
      </p>
    </div>
    </div>
  </div>
</template>
<style scoped>
.tile-wrapper {
  margin: 2rem 0;
  text-align: center;
}
</style>
