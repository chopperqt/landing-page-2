import React from 'react';
import './App.css';

import {Cart, Header, Offers, Footer, Slider} from "./modules";

function App() {
  return (
    <div className="wrap">
      <Header />
      <Slider/>
      <Offers />
      <Cart/>
      <Footer/>
    </div>
  );
}

export default App;
