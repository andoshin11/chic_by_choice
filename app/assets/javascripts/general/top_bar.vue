<template>
  <section class="p-top-bar">
    <div class="header-first hide-sm">
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
          <a href="/wishlist" class="header-first__right__wishlist">
            <i class="fa fa-heart-o"></i>
            {{ sharedStore.favoriteList.items.length }}
          </a>
          <a href="/cart" class="header-first__right__cart">
            <i class="fa fa-shopping-bag"></i>
            {{ cart.items.length }}
          </a>
        </div>
      </div>
    </div>
    <div class="header-second hide-sm">
      <div class="container">
        <nav>
          <a href="/" class="logo-container"></a>
          <div class="nav-links-container">
            <div class="dropdown">
              <div class="nav-link">What's new</div>
            </div>
            <div class="dropdown">
              <a href="/" class="nav-link dropdown-toggle active">Dresses</a>
            </div>
            <div class="dropdown">
              <div class="nav-link">Designers</div>
            </div>
            <div class="dropdown">
              <div class="nav-link">Accessories</div>
            </div>
            <div class="dropdown">
              <div class="nav-link">Occasions</div>
            </div>
            <div class="dropdown">
              <div class="nav-link">Fashion Pass</div>
            </div>
            <div class="dropdown">
              <div class="nav-link">How it Works</div>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <div class="hide-lg header-mobile">
      <a href="/" class="header-mobile__logo"><img src="/logo.png" alt=""></a>
      <div class="header-mobile__right">
        <a href="/wishlist" class="header-mobile__wishlist">
          <i class="fa fa-heart-o"></i>
          {{ sharedStore.favoriteList.items.length }}
        </a>
        <a href="/cart" class="header-mobile__cart">
          <i class="fa fa-shopping-bag"></i>
          {{ cart.items.length }}
        </a>
      </div>
    </div>
  </section>
</template>

<script>
  import topBar from './top_bar';

  export default topBar;
</script>
