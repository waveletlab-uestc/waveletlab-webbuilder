<template>
  <footer class="footer">
    <div class="container">
      <div class="columns">
        <div class="column">
          <h4 class="title"><a href="index.html">ICCWAMTIP 2019</a></h4>
          <p>The 16th International Computer Conference on Wavelet Active Media Technology and Information Processing</p>
          <ul class="information">
            <li>
              <i class="fas fa-phone has-text-info"></i>
              <a href="#">+86 15623704274</a>
            </li>
            <li>
              <i class="fas fa-map-marker has-text-info"></i>
              <a href="#">No. 2006, Xiyuan Ave., West High-tech Zone, Chengdu</a>
            </li>
            <li>
              <i class="far fa-envelope has-text-info"></i>
              <a href="mailto:icacia@uestc.edu.cn">icacia@uestc.edu.cn</a>
            </li>
          </ul>
        </div>
        <div class="column">
          <h4 class="title">Our Links</h4>
          <div class="columns">
            <ul class="column">
              <li><saber-link to="/submission.html">Submission</saber-link></li>
              <li><saber-link to="/registration.html">Registration</saber-link></li>
              <li><saber-link to="/program.html">Program</saber-link></li>
              <li><saber-link to="/news.html">News</saber-link></li>
            </ul>
            <ul class="column">
              <li><saber-link to="/speakers.html">Speakers</saber-link></li>
              <li><saber-link to="/topics.html">Topics</saber-link></li>
              <li><saber-link to="/committees.html">Committees</saber-link></li>
              <li><saber-link to="/contact.html">Contact</saber-link></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>
<style scoped>
footer {
  background-color: #19181d;
  color: #b2b1b8;
}

footer a {
  color: #fff;
}
.title {
  color: #fff;
}
.information {
  margin-top: 1rem;
}
i {
  vertical-align: middle;
}
</style>
