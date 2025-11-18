import React, { useState, useEffect, useRef } from 'react';

export interface FilterState {
  tamanho: string;
  cor: string;
  genero: string;
  faixaEtaria: string;
  material: string;
  temporada: string;
}

interface FiltroRoupasAvancadoProps {
  onFilterChange: (filters: FilterState) => void;
}

const FiltroRoupasAvancado: React.FC<FiltroRoupasAvancadoProps> = ({ onFilterChange }) => {
  const [tamanho, setTamanho] = useState('');
  const [cor, setCor] = useState('');
  const [genero, setGenero] = useState('');
  const [faixaEtaria, setFaixaEtaria] = useState('');
  const [material, setMaterial] = useState('');
  const [temporada, setTemporada] = useState('');

  const isInitialMount = useRef(true);

  useEffect(() => {
    if (isInitialMount.current) {
        isInitialMount.current = false;
        return;
    }

    const handler = setTimeout(() => {
      onFilterChange({ tamanho, cor, genero, faixaEtaria, material, temporada });
    }, 500);
    return () => clearTimeout(handler);
  }, [tamanho, cor, genero, faixaEtaria, material, temporada, onFilterChange]);

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mb-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Filtrar Produtos de Roupas</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div>
          <label htmlFor="tamanho" className="block text-gray-700 text-sm font-bold mb-2">Tamanho:</label>
          <select
            id="tamanho"
            value={tamanho}
            onChange={e => setTamanho(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Todos</option>
            <option value="P">P</option>
            <option value="M">M</option>
            <option value="G">G</option>
            <option value="GG">GG</option>
          </select>
        </div>

        <div>
          <label htmlFor="cor" className="block text-gray-700 text-sm font-bold mb-2">Cor:</label>
          <input
            type="text"
            id="cor"
            placeholder="Ex: Azul, Preto"
            value={cor}
            onChange={e => setCor(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div>
          <label htmlFor="genero" className="block text-gray-700 text-sm font-bold mb-2">Gênero:</label>
          <select
            id="genero"
            value={genero}
            onChange={e => setGenero(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Todos</option>
            <option value="Masculino">Masculino</option>
            <option value="Feminino">Feminino</option>
            <option value="Unissex">Unissex</option>
          </select>
        </div>

        <div>
          <label htmlFor="faixaEtaria" className="block text-gray-700 text-sm font-bold mb-2">Faixa Etária:</label>
          <select
            id="faixaEtaria"
            value={faixaEtaria}
            onChange={e => setFaixaEtaria(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Todas</option>
            <option value="Adulto">Adulto</option>
            <option value="Infantil">Infantil</option>
            <option value="Juvenil">Juvenil</option>
          </select>
        </div>

        <div>
          <label htmlFor="material" className="block text-gray-700 text-sm font-bold mb-2">Material:</label>
          <input
            type="text"
            id="material"
            placeholder="Ex: Algodão, Poliéster"
            value={material}
            onChange={e => setMaterial(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div>
          <label htmlFor="temporada" className="block text-gray-700 text-sm font-bold mb-2">Temporada:</label>
          <select
            id="temporada"
            value={temporada}
            onChange={e => setTemporada(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Todas</option>
            <option value="Verão">Verão</option>
            <option value="Inverno">Inverno</option>
            <option value="Primavera-Outono">Primavera-Outono</option>
          </select>
        </div>
      </div>
    </div>
  );
};

export default FiltroRoupasAvancado;
