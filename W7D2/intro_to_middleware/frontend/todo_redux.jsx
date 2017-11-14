import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // phase 1
  // store.dispatch = addLoggingToDispatch(store);

  // phase 2
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);

});

// // phase 2
// function applyMiddlewares(store, ...middlewares) {
//   let dispatch = store.dispatch;
//   middlewares.forEach( middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// }
//
// // phase 2
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };

// phase 1
// const addLoggingToDispatch = (store) => {
//   const storeDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   };
// };
