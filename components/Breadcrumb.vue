<template>
  <nav class="breadcrumb" aria-label="breadcrumbs">
    <div class="container">
      <ul>
        <li :class="name ? '' : 'is-active'">
          <saber-link to="/">Home</saber-link>
        </li>
        <li v-show="name" class="is-active">
          <a href="#" aria-current="page">{{ name }}</a>
        </li>
      </ul>
    </div>
  </nav>
</template>
<script>
export default {
  props: ["name"]
}
</script>
<style scoped>
</style>