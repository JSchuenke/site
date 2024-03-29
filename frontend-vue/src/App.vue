<script setup>
import Display from './components/Display.vue'
import MainBanner from './components/MainBanner.vue'
import MainHeader from './components/MainHeader.vue'
</script>

<template>
  <header>
    <img alt="Vue logo" class="logo" src="./assets/jake_the_dog1.png" width="125" height="125" />

    <div class="wrapper">
      <MainBanner/>
    </div>
  </header>

  <main>
    <Display/>
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
    margin: auto;
  }
}
</style>
