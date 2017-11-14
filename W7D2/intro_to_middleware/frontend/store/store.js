import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer,
                            preloadedState,
                            applyMiddleware(addLoggingToDispatch,
                                            test,
                                            testAgain));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const test = store => next => action => {
  console.log('test');
  next(action);
};

const testAgain = store => next => action => {
  console.log('test again');
  next(action);
};

export default configureStore;
