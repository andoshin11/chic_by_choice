import Vue from 'vue';
import HTTP from './../http';
import sharedStore from './../shared_store';

export default {
  props: {
    itemId: {
      require: true,
    }
  },
  computed: {
    dataValid() {
      if (sharedStore.favoriteList.items.length >= 1){
        const matchedItems = sharedStore.favoriteList.items.filter(x => x.id == this.itemId);
        console.log(matchedItems);
        return matchedItems.length >= 1 ? false : true;
      } else {
        return true;
      }
    }
  },
  data () {
    return {
    };
  },
  watch: {
  },
  methods: {
    async add() {
      try {
        if (this.dataValid) {
          await HTTP.post('/api/favorites', {
            itemId: this.itemId,
          });
          const { favoriteList: favoriteList } = await HTTP.get('/api/favorite_lists');
          sharedStore.favoriteList.items = favoriteList.items;
          alert("Item added to your Favorite List");
        } else {
          alert("The Item is already in your Favorite List");
        }
      } catch (e) {
        alert("Something went wrong!");
        console.error(e);
      }
    },
  },
};
