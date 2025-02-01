const request = require('supertest');
const app = require('../index'); // Import the app

describe('Express Server', () => {
    it('should return a 200 status and the correct message', async () => {
        const response = await request(app).get('/');
        
        // Check for 200 status code
        expect(response.status).toBe(200);
        
        // Check the response body
        expect(response.text).toBe('Hello, World! This is an updated Node.js app!');
    });
});
