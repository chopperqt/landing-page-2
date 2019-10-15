import React from 'react';

import img1 from '../../../templates/shape-3.png';
import img2 from '../../../templates/shape-6.png';
import img3 from '../../../templates/shape-5.png';

import "./style.css";
const Offers = ({}) => {
    return (
        <section className="offers">
            <div className="container">
                <div className="offers__item">
                    <div className="circle circle_blue">
                        <img src={img1} alt="Picture1"/>
                    </div>
                    <h5>Contrary to popular</h5>
                    <p>Lorem Ipsum is not simply random text. It has roots in a piece.</p>
                </div>
                <div className="offers__item">
                    <div className="circle circle_red">
                        <img src={img2} alt="Picture1"/>
                    </div>
                    <h5>Contrary to popular</h5>
                    <p>Lorem Ipsum is not simply random text. It has roots in a piece.</p>
                </div>
                <div className="offers__item">
                    <div className="circle circle_yellow">
                        <img src={img3} alt="Picture1"/>
                    </div>
                    <h5>Contrary to popular</h5>
                    <p>Lorem Ipsum is not simply random text. It has roots in a piece.</p>
                </div>
            </div>
        </section>
    )
}
export default Offers;