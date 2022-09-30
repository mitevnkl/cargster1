import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    disableMobile: "true",
    dateFormat: "d-m-Y",
    minDate: "today"
  });
}

export { initFlatpickr };
