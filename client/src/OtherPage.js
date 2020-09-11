import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      Im some other page
      <Link to="/">Go back to home page!</Link>
      <Link to="http://jaynejacobs.com">Jayne's Website</Link>
      <Link to="https://gopherclub.jaynejacobs.com/">Gopher Club</Link>
    </div>
  );
};
