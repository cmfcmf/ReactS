A CMFReactComponent is the base class of all React components.

Subclasses must overwrite #render: and return an object that responds to #asCMFReactNode. The code in #render: must not have any side effects. This also means that subclasses must not define or use instance variables. All state and side effects must be handled through React hooks.