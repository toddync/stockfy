import React from 'react';

const Header: React.FC = () => {
  return (
    <header className="bg-blue-600 text-white p-4 shadow-md">
      <div className="container mx-auto flex justify-between items-center">
        <h1 className="text-2xl font-bold">Stockify Dashboard</h1>
        <nav>
          {/* Navigation items can go here */}
        </nav>
      </div>
    </header>
  );
};

export default Header;
