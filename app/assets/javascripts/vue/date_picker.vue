<template>
  <div class="datetime-picker order__input where-date">
    <input
      type="text"
      @click="show = !show" v-model="selectedDate" @keyup.up="changeYear(1)" @keyup.down="changeYear(-1)" @keyup.left="changeMonth(-1)" @keyup.right="changeMonth(1)" placeholder="select event date here">
    <div class="picker-wrap datepicker-pop" v-show="show">
      <div class="datepicker-pop__header">
        <div class="datepicker-pop__header__title">Click on your event date to see</div>
      </div>
      <table class="date-picker datepicker-pop__body datepicker calendar">
        <thead class="calendar__header">
          <tr class="date-head month-selector">
            <th colspan="7">
              <span class="btn-prev month-selector__prev" @click="changeMonth(-1)">&lt;</span>
              <span class="show-month month-selector__current">{{ currentDate.format("MMMM") }} {{ currentDate.year() }}</span>
              <span class="btn-next month-selector__next" @click="changeMonth(1)">&gt;</span>
            </th>
          </tr>
          <tr class="date-days calendar__header__days">
            <th v-for="day in days">{{day}}</th>
          </tr>
        </thead>
        <tbody class="calendar__body">
          <tr v-for="week in weeks">
              <td v-for="date in week" @click="pickDate(date.date)" class="datepicker__day" :class="{currentMonth: date.isCurrentMonth, returnDate: date.isReturnDate, deliveryDate: date.isDeliveryDate, hiringPeriod: date.isHiringPeriod}" @mouseenter="calcSchedule(date.date)" @mouseleave="resetSchedule()">
                  {{ date.dateString }}
              </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  import datePicker from './date_picker';

  export default datePicker;
</script>
