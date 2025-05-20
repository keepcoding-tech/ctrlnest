$(document).ready(function () {
  // Retrieve dark mode setting from localStorage
  const isDarkMode = localStorage.getItem('darkMode') === 'true';

  // If dark mode was previously enabled, apply it
  if (isDarkMode) {
    $('input#dark-mode').prop('checked', true);
    ToggleDarkMode();
  }

  // Listen for changes on the dark mode toggle checkbox
  $('input#dark-mode').on('change', ToggleDarkMode);

  // Toggles the dark mode
  //
  function ToggleDarkMode () {
    if ($('input#dark-mode').is(':checked')) {
      // The Body
      $('body').addClass('dark-mode');

      // The Navbar
      $('nav.main-header:first')
          .addClass('bg-gray-dark navbar-dark')
          .removeClass('navbar-light');

      // The Aside
      $('aside')
          .addClass('navbar-dark bg-gray-dark sidebar-dark-primary')
          .removeClass('sidebar-light-primary');

      // Store the setting in localStorage
      localStorage.setItem('darkMode', 'true');
    } else {
      // The Body
      $('body').removeClass('dark-mode');

      // The Navbar
      $('nav.main-header:first')
          .addClass('navbar-light')
          .removeClass('bg-gray-dark navbar-dark');

      // The Aside
      $('aside')
          .removeClass('navbar-dark bg-gray-dark sidebar-dark-primary')
          .addClass('sidebar-light-primary');

      // Store the setting in localStorage
      localStorage.setItem('darkMode', 'false');
    }
  }
});
