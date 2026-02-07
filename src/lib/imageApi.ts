import { API_URL } from './api';

export const imageAPI = {
  // Upload bike image
  async uploadBikeImage(file) {
    try {
      const formData = new FormData();
      formData.append('image', file);

      const response = await fetch(`${API_URL}/upload/upload`, {
        method: 'POST',
        body: formData
      });

      if (!response.ok) throw new Error('Upload failed');
      return await response.json();
    } catch (error) {
      console.error('Error uploading image:', error);
      return { success: false, message: error.message };
    }
  },

  // Delete bike image
  async deleteBikeImage(publicId) {
    try {
      const response = await fetch(`${API_URL}/upload/delete/${publicId}`, {
        method: 'DELETE'
      });

      if (!response.ok) throw new Error('Delete failed');
      return await response.json();
    } catch (error) {
      console.error('Error deleting image:', error);
      return { success: false, message: error.message };
    }
  },

  // Get optimized image variants
  async getImageVariants(publicId) {
    try {
      const response = await fetch(`${API_URL}/upload/optimize/${publicId}`);

      if (!response.ok) throw new Error('Failed to get variants');
      return await response.json();
    } catch (error) {
      console.error('Error getting image variants:', error);
      return { success: false, message: error.message };
    }
  }
};
