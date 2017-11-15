import React from 'react';

const GiphysIndexItem = ({ gif }) => {
    return (
      <div >
        <img src={ gif.images.fixed_height.url } />
      </div>
    );
};

export default GiphysIndexItem;
