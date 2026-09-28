// One place to change who the demo household is.
// Every page reads this, and any element with data-resident shows the resident's name.
window.CARE_HOUSEHOLD = {
  resident: 'Margaret',
  family: {
    Alex: { name: 'Alex', role: 'Son-in-law, main contact' },
    Elena: { name: 'Elena', role: 'Daughter' }
  }
};

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('[data-resident]').forEach((element) => {
    element.textContent = window.CARE_HOUSEHOLD.resident;
  });
});
