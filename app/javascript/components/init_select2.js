import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
  $('#select_truck').select2({ minimumResultsForSearch: -1 });
  $("#select2-**element_id**-container").css('color', 'green');
  $(document).on("turbolinks:before-cache", function () {
    $('select').select2('destroy');
  });
};

export { initSelect2 };
