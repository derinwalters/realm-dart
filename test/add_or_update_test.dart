////////////////////////////////////////////////////////////////////////////////
//
// Copyright 2022 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

// ignore_for_file: avoid_relative_lib_imports

import 'package:test/test.dart' hide test, throws;
import '../lib/realm.dart';

import 'test.dart';

part 'add_or_update_test.g.dart';

@RealmModel()
class _Friend {
  @PrimaryKey()
  late int id;
  _Friend? bestFriend;
  final friends = <_Friend>[];
}

Future<void> main([List<String>? args]) async {
  await setupTests(args);

  test('Transitive adds', () {
    final realm = getRealm(Configuration.local([Friend.schema]));

    var alice = Friend(1);
    var bob = Friend(2, bestFriend: alice);

    realm.write(() => realm.add(bob));
    expect(bob.isManaged, true);
    expect(alice.isManaged, true);
    expect(realm.find<Friend>(bob.id), bob);
    expect(realm.find<Friend>(alice.id), alice);
  });

  test('Transitive updates', () {
    final realm = getRealm(Configuration.local([Friend.schema]));

    var alice = Friend(1);
    var bob = Friend(2, bestFriend: alice);

    realm.write(() => realm.add(bob));

    final aliceAgain = Friend(1);
    final bobAgain = Friend(2, bestFriend: aliceAgain);

    realm.write(() => realm.add(bobAgain, update: true));

    expect(bob.isManaged, true);
    expect(alice.isManaged, true);
    expect(bobAgain.isManaged, true);
    expect(aliceAgain.isManaged, true);

    // Re-fetch from realm
    alice = realm.find(alice.id)!;
    bob = realm.find(bob.id)!;

    expect(bob, bobAgain);
    expect(alice, aliceAgain);
    expect(bob.bestFriend, alice);
  });

  test('Cycles added correctly', () {
    final realm = getRealm(Configuration.local([Friend.schema]));

    var alice = Friend(1);
    var bob = Friend(2, bestFriend: alice);
    alice.bestFriend = bob; // form cycle

    realm.write(() => realm.add(alice));

    // Re-fetch from realm
    alice = realm.find(alice.id)!;
    bob = realm.find(bob.id)!;

    expect(alice.bestFriend, bob);
    expect(alice.bestFriend!.bestFriend, alice);
    expect(alice.bestFriend!.bestFriend!.bestFriend, bob);
  });

  test('Cycles updated correctly', () {
    final realm = getRealm(Configuration.local([Friend.schema]));

    var alice = Friend(1);
    var bob = Friend(2, bestFriend: alice);
    alice.bestFriend = bob; // form cycle

    realm.write(() => realm.add(alice));

    final aliceAgain = Friend(1);
    final bobAgain = Friend(2, bestFriend: aliceAgain);
    aliceAgain.bestFriend = bobAgain;

    alice = realm.write(() => realm.add(aliceAgain, update: true));

    // Re-fetch from realm
    alice = realm.find(alice.id)!;
    bob = realm.find(bob.id)!;

    expect(alice.bestFriend, bobAgain);
    expect(alice.bestFriend!.bestFriend, aliceAgain);
    expect(alice.bestFriend!.bestFriend!.bestFriend, bobAgain);
  });

  test('Lists updated correctly', () {
    final realm = getRealm(Configuration.local([Friend.schema]));

    var alice = Friend(1);
    var bob = Friend(2);
    var carol = Friend(3);
    alice.friends.addAll([bob, carol]);

    realm.write(() => realm.add(alice));

    expect(alice.friends, [bob, carol]);

    var dan = Friend(4);
    final aliceAgain = Friend(1, friends: [dan]);

    realm.write(() => realm.add(aliceAgain, update: true));

    // Re-fetch from realm
    alice = realm.find(alice.id)!;

    expect(alice.friends, [dan]);
  });
}
