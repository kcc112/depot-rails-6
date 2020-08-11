import React from 'react';
import ReactDOM from 'react-dom';
import { PayTypeSelector } from '../pay-type-selector';

document.addEventListener('DOMContentLoaded', function() {
  const element = document.getElementById("pay-type-component");
  ReactDOM.render(<PayTypeSelector />, element);
});


