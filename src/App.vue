<script lang="ts" setup>
import {computed, ref} from 'vue'

const count = ref(0)

const text = computed(() => {
  if (count.value > 25) {
    return "Fine, I'll keep counting. Clicks: " + count.value
  } else if (count.value > 20) {
    return "Gosh, still here?"
  } else if (count.value > 10) {
    return "What are you doing with your life?"
  } else if (count.value > 0) {
    return "Clicks: " + count.value
  } else {
    return "Click me!"
  }
})

function increment() {
  count.value++;
}
</script>

<template>
  <div class="wrapper">
    <div class="box">
      <p class="pb-2">This is a Work in Progress site. <br> Here, a button to spend some time. <br></p>
      <button class="button" @click="increment">{{ text }}</button>
    </div>
  </div>
</template>

<style>
</style>
