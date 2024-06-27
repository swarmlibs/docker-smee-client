import process from 'node:process'
import SmeeClient from 'smee-client'

const SIGNALS = ['SIGINT', 'SIGTERM']

function main() {
    const source = process.env.SOURCE_URL
    const target = process.env.TARGET_URL
    if (!source || !target) {
        console.error('SOURCE_URL and TARGET_URL must be provided, exiting...')
        process.exit(1)
    }
    const smee = new SmeeClient({
        source: source,
        target: target,
        logger: console,
    })
    const events = smee.start()
    SIGNALS.forEach(signal => {
        process.on(signal, () => {
            console.log(`Received ${signal} signal, exiting...`);
            events.close()
            process.exit(0);
        })
    })
}

main();
