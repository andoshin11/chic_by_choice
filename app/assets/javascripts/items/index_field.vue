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
      <div class="filter for-date without-border">      
        <datePicker :period="4"/>
      </div>
      <div class="filter for-size without-border">
        <div class="filter__header" @click="expandSize = !expandSize" :class="{active: expandSize}"><i class="fa fa-angle-right"></i> SIZE</div>
        <div class="filter__body" :class="{active: expandSize}">
          <div class="filter__body__button without-margin">6 UK</div>
          <div class="filter__body__button">8 UK</div>
          <div class="filter__body__button">10 UK</div>
          <div class="filter__body__button without-margin">12 UK</div>
          <div class="filter__body__button">14 UK</div>
          <div class="filter__body__button">16 UK</div>
        </div>
      </div>
      <div class="filter for-price without-border">
        <div class="filter__header" @click="expandPrice = !expandPrice" :class="{active: expandPrice}"><i class="fa fa-angle-right"></i> PRICE</div>
        <div class="filter__body" :class="{active: expandPrice}">
          <div>
            <input type="checkbox" value="0" v-model="priceFilter">
            <label>under £60</label>
          </div>
          <div>
            <input type="checkbox" value="1" v-model="priceFilter">
            <label>£61 - £120</label>
          </div>
          <div>
            <input type="checkbox" value="2" v-model="priceFilter">
            <label>£121 - £200</label>
          </div>
          <div>
            <input type="checkbox" value="3" v-model="priceFilter">
            <label>above £200</label>
          </div>
        </div>
      </div>
      <div class="filter for-length">
        <div class="filter__header" @click="expandLength = !expandLength" :class="{active: expandLength}"><i class="fa fa-angle-right"></i> LENGTH</div>
        <div class="filter__body" :class="{active: expandLength}">
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
      <div class="filter for-colour">
        <div class="filter__header" @click="expandColour = !expandColour" :class="{active: expandColour}"><i class="fa fa-angle-right"></i> COLOUR</div>
        <div class="filter__body" :class="{active: expandColour}">
          <div>
            <input type="checkbox" value="0" v-model="colourFilter">
            <label>Black</label>
          </div>
          <div>
            <input type="checkbox" value="1" v-model="colourFilter">
            <label>Blue</label>
          </div>
          <div>
            <input type="checkbox" value="2" v-model="colourFilter">
            <label>Brown</label>
          </div>
          <div>
            <input type="checkbox" value="3" v-model="colourFilter">
            <label>Burgundy</label>
          </div>
          <div>
            <input type="checkbox" value="4" v-model="colourFilter">
            <label>Gold</label>
          </div>
          <div>
            <input type="checkbox" value="5" v-model="colourFilter">
            <label>Green</label>
          </div>
          <div>
            <input type="checkbox" value="6" v-model="colourFilter">
            <label>Grey</label>
          </div>
          <div>
            <input type="checkbox" value="7" v-model="colourFilter">
            <label>Metallic</label>
          </div>
          <div>
            <input type="checkbox" value="8" v-model="colourFilter">
            <label>Nude</label>
          </div>
          <div>
            <input type="checkbox" value="9" v-model="colourFilter">
            <label>Orange</label>
          </div>
          <div>
            <input type="checkbox" value="10" v-model="colourFilter">
            <label>Pink</label>
          </div>
          <div>
            <input type="checkbox" value="11" v-model="colourFilter">
            <label>Purple</label>
          </div>
          <div>
            <input type="checkbox" value="12" v-model="colourFilter">
            <label>Red</label>
          </div>
          <div>
            <input type="checkbox" value="13" v-model="colourFilter">
            <label>Silver</label>
          </div>
          <div>
            <input type="checkbox" value="14" v-model="colourFilter">
            <label>Sparkly</label>
          </div>
          <div>
            <input type="checkbox" value="15" v-model="colourFilter">
            <label>White</label>
          </div>
          <div>
            <input type="checkbox" value="16" v-model="colourFilter">
            <label>Yellow</label>
          </div>
        </div>
      </div>
      <div class="filter for-trends">
        <div class="filter__header" @click="expandTrends = !expandTrends" :class="{active: expandTrends}"><i class="fa fa-angle-right"></i> TRENDS</div>
        <div class="filter__body" :class="{active: expandTrends}">
          <div>
            <input type="checkbox" value="0" v-model="trendsFilter">
            <label>A-line</label>
          </div>
          <div>
            <input type="checkbox" value="1" v-model="trendsFilter">
            <label>Artistic</label>
          </div>
          <div>
            <input type="checkbox" value="2" v-model="trendsFilter">
            <label>Black and white</label>
          </div>
          <div>
            <input type="checkbox" value="3" v-model="trendsFilter">
            <label>Bodycon</label>
          </div>
          <div>
            <input type="checkbox" value="4" v-model="trendsFilter">
            <label>Cut out</label>
          </div>
          <div>
            <input type="checkbox" value="5" v-model="trendsFilter">
            <label>Embroidery</label>
          </div>
          <div>
            <input type="checkbox" value="6" v-model="trendsFilter">
            <label>Floral</label>
          </div>
          <div>
            <input type="checkbox" value="7" v-model="trendsFilter">
            <label>Fringe</label>
          </div>
          <div>
            <input type="checkbox" value="8" v-model="trendsFilter">
            <label>Illusion neck line</label>
          </div>
          <div>
            <input type="checkbox" value="9" v-model="trendsFilter">
            <label>Lace</label>
          </div>
          <div>
            <input type="checkbox" value="10" v-model="trendsFilter">
            <label>Little black dress</label>
          </div>
          <div>
            <input type="checkbox" value="11" v-model="trendsFilter">
            <label>Maxi</label>
          </div>
          <div>
            <input type="checkbox" value="12" v-model="trendsFilter">
            <label>Metallic</label>
          </div>
          <div>
            <input type="checkbox" value="13" v-model="trendsFilter">
            <label>Minimalism</label>
          </div>
          <div>
            <input type="checkbox" value="14" v-model="trendsFilter">
            <label>Most popular</label>
          </div>
          <div>
            <input type="checkbox" value="15" v-model="trendsFilter">
            <label>Off shoulder</label>
          </div>
          <div>
            <input type="checkbox" value="16" v-model="trendsFilter">
            <label>Open back</label>
          </div>
          <div>
            <input type="checkbox" value="17" v-model="trendsFilter">
            <label>Orange</label>
          </div>
          <div>
            <input type="checkbox" value="18" v-model="trendsFilter">
            <label>Pastel</label>
          </div>
          <div>
            <input type="checkbox" value="19" v-model="trendsFilter">
            <label>Ruffle</label>
          </div>
          <div>
            <input type="checkbox" value="20" v-model="trendsFilter">
            <label>Sequin</label>
          </div>
          <div>
            <input type="checkbox" value="21" v-model="trendsFilter">
            <label>Sheer</label>
          </div>
          <div>
            <input type="checkbox" value="22" v-model="trendsFilter">
            <label>Top rated</label>
          </div>
          <div>
            <input type="checkbox" value="23" v-model="trendsFilter">
            <label>Velvet</label>
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