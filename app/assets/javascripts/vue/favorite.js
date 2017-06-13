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
    inList() {
      if (sharedStore.favoriteList.items.length >= 1){
        const matchedItems = sharedStore.favoriteList.items.filter(x => x.id == this.itemId);
        return matchedItems.length ? true : false;
      } else {
        return false;
      }
    }
  },
  data () {
    return {
      sharedStore: sharedStore,
    };
  },
  methods: {
    async fetch() {
      try {
        const { favoriteList: favoriteList } = await HTTP.get('/api/favorite_lists');
        sharedStore.favoriteList = favoriteList;
      } catch (e) {
        console.error(e);
      }
    },
    async add() {
      try {
        if (!this.inList) {
          await HTTP.post('/api/favorites', {
            itemId: this.itemId,
          });
          this.fetch();
        } else {
          alert("The Item is already in your Wishlist");
        }
      } catch (e) {
        alert("Something went wrong!");
        console.error(e);
      }
    },
    async remove() {
      try {
        await HTTP.delete('/api/favorites', {
          itemId: this.itemId
        });
        this.fetch();
      } catch (e) {
        alert("Something went wrong!");
        console.error(e);
      }
    },
  },
  mounted() {
    this.fetch();
  },
};
