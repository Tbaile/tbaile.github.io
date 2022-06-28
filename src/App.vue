<script setup lang="ts">
import {ref} from 'vue'

const count = ref(0)

function increment() {
  count.value++
}
</script>

<template>
  <div class="wrapper">
    <div class="box">
      <p class="pb-2">This is a Work in Progress site. <br> Here, a button to spend some time. <br></p>
      <button class="button" @click="increment">{{ count !== 0 ? "Clicks: " + count : "Click me!" }}</button>
    </div>
  </div>
</template>

<style>
</style>
