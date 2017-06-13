<template>
  <span class="dress__fav">
    <i class="fa fa-heart-o" @click="add()" v-if="!inList"></i>
    <i class="fa fa-heart" @click="remove()" v-if="inList"></i>
  </span>
</template>

<script>
  import favorite from './favorite';

  export default favorite;
</script>
