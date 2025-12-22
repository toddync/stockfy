import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Dashboard from './components/Dashboard'; // Correct import path for the new Dashboard
import pageConfigs from './pages/pageConfig';
import LoginPage from './pages/LoginPage';
import Layout from './components/Layout'; // Import the new Layout component
import { SeniorModeProvider } from './contexts/SeniorModeContext';

function App() {
  return (
    <SeniorModeProvider>
      <Router>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/" element={<Layout><Dashboard /></Layout>} /> {/* Dashboard as the home page, wrapped in Layout */}
          {/* Dynamically create routes for all other pages, wrapped in Layout */}
          {pageConfigs.map((page, index) => (
            // Exclude LoginPage from being wrapped in Layout if it's already handled separately
            page.path !== '/login' && (
              <Route key={index} path={page.path} element={<Layout><page.component /></Layout>} />
            )
          ))}
        </Routes>
      </Router>
    </SeniorModeProvider>
  );
}

export default App;