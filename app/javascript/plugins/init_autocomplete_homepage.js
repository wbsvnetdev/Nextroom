import places from 'places.js';

const initAutocompleteHomepage = () => {
  const addressInput = document.getElementById('search_query');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocompleteHomepage };
