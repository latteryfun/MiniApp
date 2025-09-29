private List<char> GenerateCode(int tip)
{
    using var random = RandomNumberGenerator.Create();
    var code = new List<char>();
    int letterCount = GetLetterCount(tip);
    int totalLength = GetRequiredLength(tip);
    byte[] randomBytes = new byte[totalLength];
    random.GetBytes(randomBytes);  // 🔥 Here Generate RandomNumber for Ticket Buyer 

    for (int i = 0; i < totalLength; i++)
    {
        if (i < letterCount) 
            code.Add((char)('A' + (randomBytes[i] % 26)));  // A Letter From A-Z
        else 
            code.Add((char)('0' + (randomBytes[i] % 10)));  // A Digits From 0 - 9
    }
    return code;
}


AND For Call Methods : 

public async Task<(string key1, string key2)> GenerateUniqueRandomCodeAsync(long username, int tip)
{
    // ...
    while (!isUnique && maxAttempts-- > 0)
    {
        var code = GenerateCode(tip);  // 🔥 Call Rnd TicketBuy Generator
        key_1 = string.Join("", code.Take(GetLetterCount(tip)));
        key_2 = string.Join("", code.Skip(GetLetterCount(tip)));
        // ...
    }
    // ...
}