
export function handler(event: any , context: any, callback: (...args: any[]) => void) {

    // just to get started you can log the event, this will cause issues
    // if you start using API gateway with binary content.
    console.log({ event });

    callback();
}
