const config = {
    mode: 'development',
    output: {
        library: {
            type: 'umd',
            name: 'add',
        },
        globalObject: 'this'
    }
};

module.exports = config;