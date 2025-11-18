import React, { useState, useEffect } from 'react';

interface Tag {
  id: number;
  nome: string;
}

interface GerenciadorTagsProps {
  produtoId: number;
  initialTags: Tag[];
  onTagsChange: (tags: Tag[]) => void;
}

const GerenciadorTags: React.FC<GerenciadorTagsProps> = ({ produtoId: _produtoId, initialTags, onTagsChange }) => {
  const [availableTags, setAvailableTags] = useState<Tag[]>([]);
  const [selectedTags, setSelectedTags] = useState<Tag[]>(initialTags);
  const [newTagName, setNewTagName] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchAvailableTags = async () => {
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch('http://localhost:3000/api/tags');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: Tag[] = await response.json();
        setAvailableTags(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar tags disponíveis: ${message}`);
        console.error("Erro ao carregar tags disponíveis:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchAvailableTags();
  }, []);

  const handleAddTag = (tag: Tag) => {
    if (!selectedTags.some(t => t.id === tag.id)) {
      const updatedTags = [...selectedTags, tag];
      setSelectedTags(updatedTags);
      onTagsChange(updatedTags);
    }
  };

  const handleRemoveTag = (tagId: number) => {
    const updatedTags = selectedTags.filter(tag => tag.id !== tagId);
    setSelectedTags(updatedTags);
    onTagsChange(updatedTags);
  };

  const handleCreateNewTag = async () => {
    if (!newTagName.trim()) return;

    setLoading(true);
    setError(null);
    try {
      // This endpoint needs to be implemented in the backend
      const response = await fetch('http://localhost:3000/api/tags', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ nome: newTagName }),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const newTag: Tag = await response.json(); // Assuming backend returns the new tag with ID
      setAvailableTags(prev => [...prev, newTag]);
      handleAddTag(newTag);
      setNewTagName('');
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao criar nova tag: ${message}`);
      console.error("Erro ao criar nova tag:", e);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando gerenciador de tags...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Gerenciador de Tags e Categorização</h2>

      <div className="mb-4">
        <h3 className="text-lg font-medium text-gray-700 mb-2">Tags Selecionadas:</h3>
        <div className="flex flex-wrap gap-2">
          {selectedTags.length === 0 ? (
            <span className="text-gray-500 text-sm">Nenhuma tag selecionada.</span>
          ) : (
            selectedTags.map(tag => (
              <span 
                key={tag.id} 
                className="bg-blue-100 text-blue-800 text-sm font-medium px-2.5 py-0.5 rounded-full flex items-center"
              >
                {tag.nome}
                <button 
                  onClick={() => handleRemoveTag(tag.id)}
                  className="ml-1 text-blue-600 hover:text-blue-800 focus:outline-none"
                >
                  &times;
                </button>
              </span>
            ))
          )}
        </div>
      </div>

      <div className="mb-4">
        <h3 className="text-lg font-medium text-gray-700 mb-2">Tags Disponíveis:</h3>
        <div className="flex flex-wrap gap-2">
          {availableTags.length === 0 ? (
            <span className="text-gray-500 text-sm">Nenhuma tag disponível.</span>
          ) : (
            availableTags.map(tag => (
              <button 
                key={tag.id} 
                onClick={() => handleAddTag(tag)}
                className="bg-gray-200 hover:bg-gray-300 text-gray-800 text-sm font-medium px-3 py-1 rounded-full transition-colors"
                disabled={selectedTags.some(t => t.id === tag.id)}
              >
                {tag.nome}
              </button>
            ))
          )}
        </div>
      </div>

      <div className="mb-4">
        <h3 className="text-lg font-medium text-gray-700 mb-2">Criar Nova Tag:</h3>
        <div className="flex">
          <input
            type="text"
            placeholder="Nome da nova tag"
            value={newTagName}
            onChange={e => setNewTagName(e.target.value)}
            className="shadow appearance-none border rounded-l w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
          <button 
            onClick={handleCreateNewTag}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-r transition-colors"
          >
            Criar e Adicionar
          </button>
        </div>
      </div>
    </div>
  );
};

export default GerenciadorTags;