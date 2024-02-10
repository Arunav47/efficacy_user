part of '../event_controller.dart';

Stream<EventPaginationResponse> _getAllEventsImpl({
  int skip = 0,
  EventStatus? eventStatus,
  List<String>? clubIDs = const [],
  bool forceGet = false,
  int count = 10,
}) async* {
  if (clubIDs != null && clubIDs.isEmpty) {
    yield const EventPaginationResponse(-1, []);
  } else {
    // EventPaginationResponse filteredEvents = await _fetchAllEventsLocal(
    //   skip: skip,
    //   clubIDs: clubIDs,
    //   forceGet: forceGet,
    //   count: count,
    // );
    // if (filteredEvents.events.isNotEmpty) yield filteredEvents;

    EventPaginationResponse filteredEvents = await _fetchAllEventsFromBackend(
      skip: skip,
      clubIDs: clubIDs ?? [],
      eventStatus: eventStatus,
      forceGet: forceGet,
      count: count,
    );
    yield filteredEvents;
  }
}

Future<EventPaginationResponse> _fetchAllEventsLocal({
  int skip = 0,
  EventStatus? eventStatus,
  List<String> clubIDs = const [],
  bool forceGet = false,
  int count = 10,
}) async {
  List<EventModel> filteredEvents = [];

  List<String> data = LocalDatabase.get(LocalDocuments.events.name);
  // Local Data
  Map localEvents = data.isEmpty ? {} : jsonDecode(data[0]);
  List<EventModel> events = localEvents.values
      .map((d) =>
          EventModel.fromJson(Formatter.convertMapToMapStringDynamic(d!)!))
      .toList();
  events.sort((EventModel a, EventModel b) {
    DateTime dateA = a.updatedAt ?? DateTime.now();
    DateTime dateB = b.updatedAt ?? DateTime.now();
    return dateA.millisecondsSinceEpoch.compareTo(dateB.millisecondsSinceEpoch);
  });
  if (forceGet) {
    await LocalDatabase.deleteKey(LocalDocuments.events.name);
  } else if (localEvents.isNotEmpty) {
    for (int i = skip;
        filteredEvents.length < count && i < events.length;
        i++) {
      if (clubIDs.isEmpty || (clubIDs.contains(events[i].clubID))) {
        filteredEvents.add(events[i]);
      }
    }
  }
  return EventPaginationResponse(
    skip + filteredEvents.length,
    filteredEvents,
  );
}

Future<EventPaginationResponse> _fetchAllEventsFromBackend({
  int skip = 0,
  EventStatus? eventStatus,
  List<String> clubIDs = const [],
  bool forceGet = false,
  int count = 10,
}) async {
  List<EventModel> filteredEvents = [];
  // Server data
  DbCollection collection =
      Database.instance.collection(EventController._collectionName);

  SelectorBuilder selectorBuilder = SelectorBuilder();
  if (clubIDs.isNotEmpty) {
    selectorBuilder.oneFrom(EventFields.clubID.name, clubIDs);
  }
  if (eventStatus != null) {
    DateTime currentTime = DateTime.now();
    if (eventStatus == EventStatus.Completed) {
      selectorBuilder.lt(
        EventFields.endDate.name,
        currentTime.toIso8601String(),
      );
    } else if (eventStatus == EventStatus.Upcoming) {
      selectorBuilder.gt(
        EventFields.startDate.name,
        currentTime.toIso8601String(),
      );
    } else {
      selectorBuilder.lte(
        EventFields.startDate.name,
        currentTime.toIso8601String(),
      );
      selectorBuilder.gte(
        EventFields.endDate.name,
        currentTime.toIso8601String(),
      );
    }
  }
  selectorBuilder.sortBy(EventFields.startDate.name, descending: false);
  selectorBuilder.skip(skip);
  selectorBuilder.limit(count);

  List<Map<String, dynamic>> res =
      await collection.find(selectorBuilder).toList();
  filteredEvents = res.map((model) => EventModel.fromJson(model)).toList();
  for (int i = 0; i < filteredEvents.length; i++) {
    filteredEvents[i] = await EventController._save(filteredEvents[i]);
  }
  return EventPaginationResponse(
    filteredEvents.length < count ? -1 : skip + filteredEvents.length,
    filteredEvents,
  );
}
