import React from 'react';
import { Link } from 'react-router-dom';
import pageConfigs from '../pages/pageConfig'; // Import pageConfigs to generate sidebar links

const Sidebar: React.FC = () => {
  return (
    <aside className="bg-gray-800 text-white w-64 p-4 space-y-2 shadow-lg">
      <h2 className="text-3xl font-bold mb-6 text-center text-blue-400">Stockify</h2>
      <nav>
        <ul>
          <li>
            <Link to="/" className="block py-2 px-4 rounded hover:bg-gray-700 transition-colors duration-200">
              Dashboard
            </Link>
          </li>
          {pageConfigs.map((page) => (
            // Exclude LoginPage from the sidebar
            page.path !== '/login' && (
              <li key={page.path}>
                <Link to={page.path} className="block py-2 px-4 rounded hover:bg-gray-700 transition-colors duration-200">
                  {page.name}
                </Link>
              </li>
            )
          ))}
        </ul>
      </nav>
    </aside>
  );
};

export default Sidebar;
