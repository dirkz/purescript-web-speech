import './App.css';
import { jsCounter as Counter } from "./output/App.Components.Counter/";

function App() {
  return (
    <div className="app">
      <header className="app-header">
        <Counter label="Click me!" />
      </header>
    </div>
  );
}

export default App;
