import $ from 'jquery';

const showFilter = () => {
  if (window.innerWidth < 769) {
    $('#myCollapse').addClass('show').removeClass('show');
  }
};

export { showFilter };
