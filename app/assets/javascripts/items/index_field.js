import HTTP from './../http';
import datePicker from './date_picker.vue'

export default {
  components: {
    datePicker,
  },
  data() {
    return {
      expandColour: false,
      expandPrice: false,
      expandLength: false,
      expandSize: false,
      expandTrends: false,
      colourFilter: [],
      lengthFilter: [],
      trendsFilter: [],
      sortBy: [
        {
          label: "FEATURED",
          key: 0,
        },
        {
          label: "PRICE HIGH TO LOW",
          key: 1,
        },
        {
          label: "PRICE LOW TO HIGH",
          key: 2,
        },
        {
          label: "MOST POPULAR",
          key: 3,
        },
      ],
      sortByKey: 0,
    };
  },
  methods: {
    async fetch() {
      try {
      } catch (e) {
        console.error(e);
      }
    },
  },
  mounted() {
  },
};
