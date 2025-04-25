import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://express_app:3000/api';

export const fetchProductos = async () => {
  try {
    const response = await axios.get(`${API_URL}/productos`);
    return response.data;
  } catch (error) {
    console.error('Error fetching productos:', error);
    throw error;
  }
};

export const fetchProductoById = async (id) => {
  try {
    const response = await axios.get(`${API_URL}/productos/${id}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching producto by id:', error);
    throw error;
  }
};

export const createUser = async (userData) => {
  try {
    const response = await axios.post(`${API_URL}/usuarios`, userData);
    return response.data;
  } catch (error) {
    console.error('Error creating user:', error);
    throw error;
  }
};

export const loginUser = async (email, password) => {
  try {
    const response = await axios.post(`${API_URL}/login`, { email, password });
    return response.data;
  } catch (error) {
    console.error('Error logging in:', error);
    throw error;
  }
};

export const fetchUserProfile = async (token) => {
  if (!token) {
    throw new Error('Token no proporcionado');
  }

  try {
    const response = await axios.get(`${API_URL}/usuarios/perfil`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    console.error('Error fetching user profile:', error.response ? error.response.data : error.message);
    throw error;
  }
};

export const buscarProductos = async (nombre, minPrecio, maxPrecio) => {
  try {
    const response = await axios.get(`${API_URL}/productos`, {
      params: { nombre, minPrecio, maxPrecio },
    });
    return response.data;
  } catch (error) {
    throw new Error(error.response?.data?.message || 'Error desconocido');
  }
};

export const getCarrito = async (userId) => {
  try {
    const response = await axios.get(`${API_URL}/carritos/${userId}`);
    return response.data;
  } catch (error) {
    console.error('Error al obtener el carrito:', error);
    throw error;
  }
};

export const addToCarrito = async (productId, cantidad) => {
  const token = localStorage.getItem('token');
  console.log('Token recuperado del localStorage:', token);

  try {
    console.log('Datos enviados:', { productId, cantidad });
    const response = await axios.post(
      `${API_URL}/carritos/producto`,
      { productId, cantidad },
      {
        headers: {
          Authorization: `Bearer ${token}`,
          'Content-Type': 'application/json',
        },
      }
    );
    console.log('Respuesta del servidor:', response.data);
  } catch (error) {
    console.error('Error al agregar al carrito:', error.response?.data || error.message);
  }
};

export const removeFromCarrito = async (userId, productoId) => {
  try {
    const response = await axios.delete(`${API_URL}/carritos/${userId}/${productoId}`);
    return response.data;
  } catch (error) {
    console.error('Error al eliminar del carrito:', error);
    throw error;
  }
};