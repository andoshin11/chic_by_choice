<template>
  <div class="container">
    <div class="col-md-12 index-header">
      <div class="index-header__sort">
        SORT BY <select v-model="sortByKey"><option v-for="sort in sortBy" :value="sort.key">{{ sort.label }}</option></select>
      </div>
      <div class="index-header__pagination"></div>
    </div>
    <div class="col-md-3 index-sidebar">
      <div class="index-sidebar__header">Filter <span>Clear all</span></div>
      <div class="filter for-price">
        <div class="filter__header is-bold" @click="toggleFilter(1)" :class="{active: openedFilter == 1}">Price<i class="fa fa-angle-down"></i></div>
        <div class="filter__body" :class="{active: openedFilter == 1}">
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
        <div class="filter__header is-bold" @click="toggleFilter(2)" :class="{active: openedFilter == 2}">Length<i class="fa fa-angle-down"></i></div>
        <div class="filter__body" :class="{active: openedFilter == 2}">
          <div>
            <input type="checkbox" value="0" v-model="lengthFilter">
            <label>Floor length</label>
          </div>
          <div>
            <input type="checkbox" value="1" v-model="lengthFilter">
            <label>Knee length</label>
          </div>
          <div>
            <input type="checkbox" value="2" v-model="lengthFilter">
            <label>Mini</label>
          </div>
          <div>
            <input type="checkbox" value="3" v-model="lengthFilter">
            <label>Short</label>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-9">
      <div class="row">
        <div class="dress col-md-4" v-for="item in items">
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
    </div>
  </div>
</template>


<script>
  import indexField from './index_field';

  export default indexField;
</script>
