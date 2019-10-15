import React from 'react'
import "./style.css";

import ok from '../../../templates/ok.png';
import iphone from '../../../templates/iphone.png';

import left from '../../../templates/left-arrow.png';
import right from '../../../templates/right-arrow.png';

const Slider = ({rightClick,leftClick}) => {
    return (
        <div className="slider">
            <div className="slider__container">
                <div className="slider__container__item">
                    <div className="slider__container__item__wrap">
                        <div className="item__div item__div_img">
                            <img src={iphone} alt="iphone"/>
                        </div>
                        <div className="item__div">
                            <h1>Lorem Ipsum is simply</h1>
                            <h2>dummy text of the <br/> printing & typesetting </h2>
                            <button className="sign_up_btn"><img src={ok} alt=""/> Sign up now</button>
                        </div>
                    </div>
                </div>
                <div className="slider__container__item">
                    <div className="slider__container__item__wrap">
                        <div className="item__div item__div_img">
                            <img src={iphone} alt="iphone"/>
                        </div>
                        <div className="item__div">
                            <h1>Lorem Ipsum is simply</h1>
                            <h2>dummy text of the <br/> printing & typesetting </h2>
                            <button className="sign_up_btn"><img src={ok} alt=""/> Sign up now</button>
                        </div>
                    </div>
                </div>
                <div className="slider__container__item">
                    <div className="slider__container__item__wrap">
                        <div className="item__div item__div_img">
                            <img src={iphone} alt="iphone"/>
                        </div>
                        <div className="item__div">
                            <h1>Lorem Ipsum is simply</h1>
                            <h2>dummy text of the <br/> printing & typesetting </h2>
                            <button className="sign_up_btn"><img src={ok} alt=""/> Sign up now</button>
                        </div>
                    </div>
                </div>
            </div>
            <div className="navigation">
                <div className="navigation__arrow">
                    <button className="arrow arrow_left" onClick={leftClick.bind(this,'left')}><img src={left} alt=""/></button>
                    <button className="arrow arrow_right" onClick={rightClick.bind(this,'right')}><img src={right} alt=""/></button>
                </div>
            </div>
        </div>
    )
};
export default Slider;