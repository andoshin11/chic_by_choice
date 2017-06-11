<template>

  <div class="first-top-bar header-first">
    <div class="container">
      <div class="header-first__left">
        <div class="call-us">
          <a href="/" class="tell-number">
            <i class="fa fa-phone"></i>
            <span class="call-us__number">123 4567 8901</span>
          </a>
        </div>
      </div>
      <div class="header-first__right">
        <div class="header-first__right__wishlist">
          <i class="fa fa-heart-o"></i>0
        </div>
        <a href="/cart" class="header-first__right__cart">
          <i class="fa fa-shopping-bag"></i>
          {{ cart.items.length }}
        </a>
      </div>
    </div>
  </div>

</template>

<script>
  import topBar from './top_bar';

  export default topBar;
</script>
