class SERVER 
{
    tag = "SERVER";
    class server
    {
        file = "functions\server";
        class healPlayers {};
        class deserializeState {}; 
        class updatePlayerAction {}; 
    };

};
class CLIENT {
    tag="CLIENT";
    class client
    {
        file = "functions\client";
        class healPlayerLocal {};
        class supportPlayerAction {}; 
        class supportPlayerHandler {}; 
         class createLight {}; 
    };
}