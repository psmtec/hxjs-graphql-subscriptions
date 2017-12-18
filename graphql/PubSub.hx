package graphql;

import js.node.events.EventEmitter;

typedef PubSubOptions = {
    ?eventEmitter: IEventEmitter, // TODO (DK) correct?
}

// TODO (DK)
typedef AsyncIterator<T> = {
}

@:jsRequire('graphql-subscriptions', 'PubSub')
extern class PubSub {
    public function new( ?opts: PubSubOptions );

    public function publish( triggerName: String, payload: Any ) : Bool;
    public function subscribe( triggerName: String, onMessage: Array<Any> -> Void ) : js.Promise<Int>;
    public function unsubscribe( subscriptionId: Int ) : Void;

    // @:overload(function( triggers: Array<String> ) : AsyncIterator<T>)
    public function asyncIterator<T>( triggers: String ) : AsyncIterator<T>;
}
