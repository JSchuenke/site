<script setup>
</script>

<template>
  <div class="greetings">
    <h1 class="green">Summary</h1>
    <h1 class="green">Experience</h1>
    <h1 class="green">Demo</h1>
  </div>
</template>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}

.greetings h1,
.greetings h3 {
  /* text-align: center; */
  margin: auto;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}
</style>
