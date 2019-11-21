<template>
  <div>
    <aside class="menu has-background-light">
      <ul class="menu-list is-size-5 is-capitalized">
        <li>
          <saber-link to="/Information.html">Conference Information</saber-link>
        </li>
        <li>
          <saber-link to="/Guidance.html">Author Guidance</saber-link>
        </li>
        <li>
          <saber-link to="/Timeline.html">Conference Timeline</saber-link>
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
      <a class="button is-uppercase is-white is-outlined" href="/doc/CallforPaper_EN.pdf" download="CallforPaper_EN.pdf">Call for paper</a>
      </br>
      <a class="button is-uppercase is-white is-outlined" href="/doc/ICCWAMTIP+paper+format.dot" download="Paper format.dot">Paper format</a>
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
