import React from 'react';
import Logo from '../../../templates/logo.png';
import "./style.css";

const Header = ({}) => {
  return (
      <header>
          <div className="container">
              <div className="logo">
                  <a href="/"><img src={Logo} alt="Logo"/></a>
              </div>
              <div className="menu">
                  <div className="menu__ul">
                      <li className="menu__ul_li"><a href="/">Home</a></li>
                      <li className="menu__ul_li"><a href="/">Products</a></li>
                      <li className="menu__ul_li"><a href="/">Services</a></li>
                      <li className="menu__ul_li"><a href="/">Contact</a></li>
                  </div>
              </div>
          </div>
      </header>
  )
};
export default Header;