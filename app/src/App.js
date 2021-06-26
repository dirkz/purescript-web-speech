import './App.css';
import { jsListVoices as ListVoices } from "./output/App.Components.ListVoices/";

function App() {
  return (
    <div className="app">
      <header className="app-header">
        <ListVoices />
      </header>
    </div>
  );
}

export default App;
