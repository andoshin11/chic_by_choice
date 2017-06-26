<template>
  <div class="container">
    <div class="col-md-12 index-header hide-sm">
      <div class="index-header__left">
      </div>
      <div class="index-header__right">
        <div class="index-header__pager index-pager">
          <div class="index-pager__pages">
            <div class="index-pager__pages__page" v-for="page in pages">{{ page }}</div>
            <div class="index-pager__pages__total">of {{ pageTotalNum }}</div>
          </div>
          <div class="index-pager__nav is-bold">PREVIOUS</div>
          <div class="index-pager__nav is-bold">NEXT</div>
        </div>
      </div>
      <div class="index-header__pagination"></div>
    </div>
    <div class="col-md-3 index-sidebar hide-sm">
      <div class="filter for-price">
        <div class="filter__header is-bold" @click="toggleActive('for-price')">Price<i class="fa fa-angle-down"></i></div>
        <div class="filter__body">
          <div class="slider">
            <div class="slider__header">
              <span style="float: left;">Min</span>
              <span style="float: right;">Max</span>
            </div>
            <vue-slider ref="slider" v-model="priceRange" :max="500" :tooltip="false" />
          </div>
          <div class="price-range">£{{ priceRange[0] }} - £{{ priceRange[1] }}</div>
        </div>
      </div>
      <div class="filter for-length">
        <div class="filter__header is-bold" @click="toggleActive('for-length')">Length<i class="fa fa-angle-down"></i></div>
        <div class="filter__body">
          <div class="filter__length">Floor Lenght</div>
          <div class="filter__length">Knee Length</div>
          <div class="filter__length">Mini</div>
          <div class="filter__length">Short</div>
        </div>
      </div>
    </div>
    <div class="col-md-9 col-xs-12">
      <div class="row hide-sm">
        <div class="dress col-md-4 col-xs-6" v-for="item in filteredItems">
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
            <span class="dress__price__retail">Hire £ {{ item.retailPrice }}</span>
          </div>
        </div>
      </div>
      <div class="row hide-lg">
        <div class="dress col-md-4 col-xs-6" v-for="item in filteredItems">
          <favorite :itemId="item.id"/>
          <div class="dress__images">
            <img :src="image.url" alt="" class="dress__images__image" :class="[ image.category == 1 ? 'main' : 'sub' ]" v-for="image in item.images">
          </div>
          <a :href="itemLink(item)" class="dress__designer is-bold">{{ item.designer.name }}</a>
          <a :href="itemLink(item)" class="dress__name">{{ item.name }}</a>
          <div class="dress__price is-bold">
            <span class="dress__price__hire">Hire £ {{ item.hirePrice }}</span>
            <span class="dress__price__retail">Hire £ {{ item.retailPrice }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
  import indexField from './index_field';

  export default indexField;
</script>
