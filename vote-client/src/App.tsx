import { BrowserRouter, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';
import PollPage from './pages/PollPage';
import NewPollPage from './pages/NewPollPage'; 

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/poll/:id" element={<PollPage />} />
        <Route path="/polls/new" element={<NewPollPage />} />  {/* сюда */}
      </Routes>
    </BrowserRouter>
  );
}

export default App;
