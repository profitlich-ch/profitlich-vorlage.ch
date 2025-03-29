import { defineConfig, loadEnv } from 'vite';

// Match ports in .ddev/config.yaml and config/vite.php
const HTTP_PORT = 3000;
const HTTPS_PORT = 3001;

export default defineConfig(({ command, mode }) => {
    const env = loadEnv(mode, process.cwd(), '');

    return {
        // In dev mode, we serve assets at the root of https://my.ddev.site:3000
        // In production, files live in the /dist directory
        base: command === 'serve' ? '' : '/dist/',
        build: {
            manifest: true,
            outDir: './web/dist/',
            rollupOptions: {
                input: {
                    app: 'src/app.ts',
                },
            },
        },
        server: {
            // Special address that respond to all network requests
            host: '0.0.0.0',
            // Use a strict port because we have to hard code this in vite.php
            strictPort: true,
            // This is the port running "inside" the Web container
            // It's the same as continer_port in .ddev/config.yaml
            port: HTTP_PORT,
            // Setting a specific origin ensures that your fonts & images load
            // correctly. Assumes you're accessing the front-end over https
            origin: env.PRIMARY_SITE_URL + ':' + HTTPS_PORT,
            cors: true, // Aktivieren Sie CORS
        },
    };
});