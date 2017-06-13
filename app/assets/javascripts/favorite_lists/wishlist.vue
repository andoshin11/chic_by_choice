<template>
  <div class="container wishlist">
    <div v-if="!sharedStore.favoriteList.items.length" class="wishlist__empty">You have no dresses in your Wishlist</div>
    <div class="dress col-md-3" v-for="item in sharedStore.favoriteList.items">
      <favorite :itemId="item.id"/>
      <div class="dress__sizes">
        <div class="dress__sizes__size">6</div>
        <div class="dress__sizes__size">8</div>
        <div class="dress__sizes__size">10</div>
      </div>
      <div class="dress__images">
        <img :src="image.url" alt="" class="dress__images__image" :class="[ image.category == 1 ? 'main' : 'sub' ]" v-for="image in item.images">
      </div>
      <a :href="itemLink(item)" class="dress__designer is-bold">{{ item.designer.name }}</a>
      <a :href="itemLink(item)" class="dress__name">{{ item.name }}</a>
      <div class="dress__price is-bold">
        <span class="dress__price__hire">Hire £ {{ item.hirePrice }}</span>
        <span class="dress__price__retail">Retail £ {{ item.retailPrice }}</span>
      </div>
    </div>
  </div>
</template>


<script>
  import wishlist from './wishlist';

  export default wishlist;
</script>
